PROGRAM main
USE UserFunction_Class
USE GlobalData
USE FPL

IMPLICIT NONE

TYPE(UserFunction_) :: obj
! REAL(DFP) :: val
CHARACTER(*), PARAMETER :: tomlFileName = "./UserFunction.toml"
CHARACTER(*), PARAMETER :: tomlName = "userFunction"
CHARACTER(*), PARAMETER :: testname = "import from toml"

CALL FPL_Init
CALL obj%ImportFromToml(filename=tomlFileName, tomlName=tomlName)
CALL obj%Display("ImportFromToml :")

! CALL obj%Get(val=val, args=[1.0_DFP])
! CALL Display(val, "val: ")

CALL FPL_Finalize
END PROGRAM main
