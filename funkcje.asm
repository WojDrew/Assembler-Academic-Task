.686

.model flat
public _objetosc
.data
	dwa dq 2.0
	trzy dq 3.0
	bufor dq ?
	maleR dq ?
.code
_objetosc PROC
nop
pop ax
	push ebp
	mov ebp, esp
	
	finit
	
	;fld qword PTR [ebp + 32] ;grubsc scianki
	;fld qword PTR [ebp + 24] ;D
	;fld qword PTR [ebp + 16] ;L
	;fld qword PTR [ebp + 8] ;H

	fld qword PTR dwa ;st(0) = 2
	fmul qword PTR [ebp + 32] ;st(0) = 2y
	fld qword PTR [ebp + 24] ;st(0) = D, st(1) = 2y
	
	fsub ;st(0) = D - 2y
	fchs
	fdiv qword PTR dwa ;st(0) = (D - 2y)/2 = r

	fst qword PTR maleR

	fmul st(0),st(0) ; st(0) = r^2
	fldpi ;st(0) = pi, st(1) = r^2
	fmul ;st(0) = pi*r^2
	fmul qword PTR [ebp + 16] ;st(0) = V walca
	fst qword PTR bufor

	finit

	fld qword ptr[ebp + 8] ; st(0) = H
	fsub qword ptr[ebp + 16] ; st(0) = H - L
	fdiv dwa ; st(0) = (H - L)/2
	fsub  qword ptr[ebp + 32] ; st(0) = h

	fld maleR ; st(0) = promien
	fmul maleR ; st(0) = promien^2

	fdiv st(0), st(1) ; st(0) = promien^2/h
	fadd st(0), st(1) ; st(0) = promien^2/h + h
	fdiv dwa    ; st(0) = (promien^2/h + h)/2 = R


	fld st(1) ; st(0) = h st(1) = R st(2) = h
	fmul st(0), st(0) ; st(0) = h^2
	fldpi ; st(0) = PI st(1) = h^2 st(2) = R st(3) = h
	fmul st(0), st(1) ; st(0) = PI * h^2 st(1) = h^2 st(2) = R st(3) = h
	fdiv trzy ; st(0) = (PI * h^2)/3
	fld st(2) ; st(0) = R st(1) = (PI * h^2)/3 st(2) = h^2 st(3) = R st(4) = h
	fmul trzy ; st(0) = 3R
	fsub st(0), st(4) ; st(0) = 3R - h
	fmul st(0), st(1) ; st(0) = (3R - h)*(PI * h^2)/3
	fmul dwa

	fadd bufor

	pop ebp
	ret
_objetosc ENDP
END