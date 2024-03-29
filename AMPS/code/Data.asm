; ===========================================================================
; ---------------------------------------------------------------------------
; Flags section. None of this is required, but I added it here to
; make it easier to debug built ROMS! If you would like easier
; assistance from Aurora, please keep this section intact!
; ---------------------------------------------------------------------------
	dc.b "AMPS-x2.1"		; ident str

	if safe
		dc.b "s"		; safe mode enabled

	else
		dc.b " "		; safe mode disabled
	endif

	if FEATURE_FM6
		dc.b "F6"		; FM6 enabled
	endif

	if FEATURE_PSG4
		dc.b "P4"		; PSG4 enabled
	endif

	if FEATURE_PSGADSR
		dc.b "PA"		; PSG ADSR enabled
	endif

	if FEATURE_SFX_MASTERVOL
		dc.b "SM"		; sfx ignore master volume
	endif

	if FEATURE_UNDERWATER
		dc.b "UW"		; underwater mode enabled
	endif

	if FEATURE_MODULATION
		dc.b "MO"		; modulation enabled
	endif

	if FEATURE_DACFMVOLENV
		dc.b "VE"		; FM & DAC volume envelope enabled
	endif

	if FEATURE_MODENV
		dc.b "ME"		; modulation envelope enabled
	endif

	if FEATURE_PORTAMENTO
		dc.b "PM"		; portamento enabled
	endif

	if FEATURE_BACKUP
		dc.b "BA"		; backup enabled
	endif

	if FEATURE_MODTL
		dc.b "MT"		; TL modulation
	endif

	if FEATURE_FM3SM
		dc.b "S3"		; FM3 special mode
	endif

	if FEATURE_SOUNDTEST
		dc.b "ST"		; soundtest enabled
	endif
; ===========================================================================
; ---------------------------------------------------------------------------
; Define music and SFX
; ---------------------------------------------------------------------------

	opt oz-				; disable zero-offset optimization
	if safe=0
		nolist			; if in safe mode, list data section.
	endif

__mus =		MusOff

MusicIndex:
	ptrMusic GHZ, $30, LZ, $26, MZ, $1A, SLZ, $20, SYZ, $49, SBZ, $13, FZ, $18
	ptrMusic Boss, $12, SS, $20, Invincibility, $20, Drowning, $00
	ptrMusic Title, $00, GotThroughAct, $00, Emerald, $00, ExtraLife, $00
	ptrMusic GameOver, $00, Continue, $00, Ending, $00, Credits, $00, SEGA, $00

MusCount =	__mus-MusOff		; number of installed music tracks
SFXoff =	__mus			; first SFX ID
__sfx =		SFXoff
; ---------------------------------------------------------------------------

SoundIndex:
	ptrSFX	$01, RingRight
	ptrSFX	0, RingLeft, RingLoss, Splash, Break, Jump, Roll
	ptrSFX	0, Skid, SpikeHit, Death, Register, Bonus, Shield
	ptrSFX	0, BossHit, Switch, Lamppost, BigRing, Bumper
	ptrSFX	0, Spring, Collapse, Smash, Basaran, BuzzExplode
	ptrSFX	0, Explode, Electricity, Flame, LavaBall, SpikeMove
	ptrSFX	0, Rumble, Door, Chain, Saw, Lava
	ptrSFX	$20, Bubble, Drown, AirDing, Dash, Signpost, Stomp

	ptrSFX	0, EnterSS, Goal, ActionBlock, Diamonds, Continue

; SFX with special features
	ptrSFX	$80, PushBlock

; unused SFX
	ptrSFX	0, UnkA2, UnkAB, UnkB8

SFXcount =	__sfx-SFXoff		; number of intalled sound effects
SFXlast =	__sfx
; ===========================================================================
; ---------------------------------------------------------------------------
; Define samples
; ---------------------------------------------------------------------------

__samp =	$80
SampleList:
	sample $0000, Stop, Stop		; 80 - Stop sample (DO NOT EDIT)
	sample $0100, Kick, Stop		; 81 - Kick
	sample $0100, Snare, Stop		; 82 - Snare
	sample $0100, Timpani, Stop, HiTimpani	; 83 - Hi Timpani
	sample $00E6, Timpani, Stop, MidTimpani	; 84 - Timpani
	sample $00C2, Timpani, Stop, LowTimpani	; 85 - Low Timpani
	sample $00B6, Timpani, Stop, FloorTimpani; 86 - Floor Timpani
	sample $0100, Sega, Stop		; 87 - SEGA screen
; ===========================================================================
; ---------------------------------------------------------------------------
; Define volume envelopes and their data
; ---------------------------------------------------------------------------

vNone =		$00
__venv =	$01

VolEnvs:
	volenv 01, 02, 03, 04, 05, 06, 07, 08
	volenv 09
VolEnvs_End:
; ---------------------------------------------------------------------------

vd01:		dc.b $00, $00, $00, $08, $08, $08, $10, $10
		dc.b $10, $18, $18, $18, $20, $20, $20, $28
		dc.b $28, $28, $30, $30, $30, $38, eHold

vd02:		dc.b $00, $10, $20, $30, $40, $7F, eHold

vd03:		dc.b $00, $00, $08, $08, $10, $10, $18, $18
		dc.b $20, $20, $28, $28, $30, $30, $38, $38
		dc.b eHold

vd04:		dc.b $00, $00, $10, $18, $20, $20, $28, $28
		dc.b $28, $30, eHold

vd05:		dc.b $00, $00, $00, $00, $00, $00, $00, $00
		dc.b $00, $00, $08, $08, $08, $08, $08, $08
		dc.b $08, $08, $08, $08, $08, $08, $08, $08
		dc.b $10, $10, $10, $10, $10, $10, $10, $10
		dc.b $18, $18, $18, $18, $18, $18, $18, $18
		dc.b $20, eHold

vd06:		dc.b $18, $18, $18, $10, $10, $10, $10, $08
		dc.b $08, $08, $00, $00, $00, $00, eHold

vd07:		dc.b $00, $00, $00, $00, $00, $00, $08, $08
		dc.b $08, $08, $08, $10, $10, $10, $10, $10
		dc.b $18, $18, $18, $20, $20, $20, $28, $28
		dc.b $28, $30, $38, eHold

vd08:		dc.b $00, $00, $00, $00, $00, $08, $08, $08
		dc.b $08, $08, $10, $10, $10, $10, $10, $10
		dc.b $18, $18, $18, $18, $18, $20, $20, $20
		dc.b $20, $20, $28, $28, $28, $28, $28, $30
		dc.b $30, $30, $30, $30, $38, $38, $38, eHold

vd09:		dc.b $00, $08, $10, $18, $20, $28, $30, $38
		dc.b $40, $48, $50, $58, $60, $68, $70, $78
		dc.b eHold
		even
; ===========================================================================
; ---------------------------------------------------------------------------
; Define volume envelopes and their data
; ---------------------------------------------------------------------------

mNone =		$00
__menv =	$01

ModEnvs:
	modenv
ModEnvs_End:
; ---------------------------------------------------------------------------

	if FEATURE_MODENV

	endif

; ===========================================================================
; ---------------------------------------------------------------------------
; Include music, sound effects and voice table
; ---------------------------------------------------------------------------

	include "AMPS/ADSR.s2a"		; include universal ADSR bank
	include "AMPS/Voices.s2a"	; include universal Voice bank
	opt ae-				; disable automatic evens

sfxaddr	incSFX				; include all sfx
musaddr	incMus				; include all music
musend
	even

dSoundNames:
	allnames			; include all sound names in an array
; ===========================================================================
; ---------------------------------------------------------------------------
; Include samples and filters
; ---------------------------------------------------------------------------

		align	$8000		; must be aligned to bank... By the way, these are also set in Z80.asm. Be sure to check it out also.
fLog:		incbin "AMPS/filters/Logarithmic.dat"	; logarithmic filter (no filter)
;fLinear:	incbin "AMPS/filters/Linear.dat"	; linear filter (no filter)

dacaddr		dcb.b Z80E_Read*(MaxPitch/$100),$00
SWF_Stop:	dcb.b $8000-(2*Z80E_Read*(MaxPitch/$100)),$80
SWFR_Stop:	dcb.b Z80E_Read*(MaxPitch/$100),$00
; ---------------------------------------------------------------------------

	incSWF	Kick, Timpani, Snare, Sega
	opt ae+				; enable automatic evens
	list				; continue source listing
; ---------------------------------------------------------------------------
