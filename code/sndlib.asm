; ===========================================================================
; ---------------------------------------------------------------------------
; Disable a specific sound channel
;
; input:
;   a1 - Channel address
; ---------------------------------------------------------------------------

slDisableChannel:
		bset	#cfbDisabl,(a1)		; check if already disabled & also disable
		bne.s	.skip			; if so, do not request a volume update
		bset	#cfbVol,(a1)		; also request an immediate volume update

.skip
		rts
; ===========================================================================
; ---------------------------------------------------------------------------
; Enable a specific sound channel
;
; input:
;   a1 - Channel address
; ---------------------------------------------------------------------------

slEnableChannel:
		bclr	#cfbDisabl,(a1)		; check if already enabled & also enable
		beq.s	.skip			; if so, do not request a volume update
		bset	#cfbVol,(a1)		; also request an immediate volume update

.skip
		rts
