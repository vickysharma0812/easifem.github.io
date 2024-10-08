PROGRAM main
USE GlobalData
USE BaseType, ONLY: DOF_
USE DOF_Method
USE Test_Method

IMPLICIT NONE

TYPE(DOF_) :: obj
INTEGER(I4B) :: ii

! Initiate an instance of [DOF_](DOF_.md)
CALL Initiate(obj, tNodes=[10, 5], &
              names=["V", "P"], spaceCompo=[3, 1], &
              timeCompo=[2, 2], storageFMT=FMT_DOF)

! GetIndex
CALL OK(GetIDOF(spaceCompo=1, timeCompo=1, tSpaceCompo=3) .EQ. 1, 'GetIDOF')
CALL OK(GetIDOF(spaceCompo=1, timeCompo=2, tSpaceCompo=3) .EQ. 4, 'GetIDOF')
CALL Display(GetIDOF(obj=obj, spaceCompo=1, timeCompo=1, ivar=1), 'GetIDOF')
CALL OK(GetIDOF(obj=obj, spaceCompo=1, timeCompo=1, ivar=1) .EQ. 1, 'GetIDOF')
CALL OK(GetIDOF(obj=obj, spaceCompo=2, timeCompo=1, ivar=1) .EQ. 2, 'GetIDOF')
CALL OK(GetIDOF(obj=obj, spaceCompo=3, timeCompo=1, ivar=1) .EQ. 3, 'GetIDOF')
CALL OK(GetIDOF(obj=obj, spaceCompo=1, timeCompo=2, ivar=1) .EQ. 4, 'GetIDOF')
CALL OK(GetIDOF(obj=obj, spaceCompo=2, timeCompo=2, ivar=1) .EQ. 5, 'GetIDOF')
CALL OK(GetIDOF(obj=obj, spaceCompo=3, timeCompo=2, ivar=1) .EQ. 6, 'GetIDOF')
CALL OK(GetIDOF(obj=obj, spaceCompo=1, timeCompo=1, ivar=2) .EQ. 7, 'GetIDOF')
CALL OK(GetIDOF(obj=obj, spaceCompo=1, timeCompo=2, ivar=2) .EQ. 8, 'GetIDOF')

CALL DEALLOCATE (obj)
END PROGRAM main
