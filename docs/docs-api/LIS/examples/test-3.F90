PROGRAM main
USE easifemBase
#include "lisf.h"

! CHARACTER(*), PARAMETER :: matrix_name = "../../CSRMatrix/matrixMarket/e40r0000.mtx"
! CHARACTER(*), PARAMETER :: rhs_name = "../../CSRMatrix/matrixMarket/e40r0000_rhs1.mtx"
CHARACTER(*), PARAMETER :: matrix_name = "../../CSRMatrix/matrixMarket/small5.mtx"
CHARACTER(*), PARAMETER :: rhs_name = "../../CSRMatrix/matrixMarket/small5_rhs.mtx"
INTEGER :: ierr
LIS_MATRIX :: A
TYPE(CSRMatrix_) :: csrmat
REAL(DFP), ALLOCATABLE :: rhs(:)
REAL(DFP), ALLOCATABLE :: sol(:)
INTEGER(I4B), ALLOCATABLE :: ia(:)
INTEGER(I4B), ALLOCATABLE :: ja(:)
INTEGER(I4B) :: n
INTEGER(I4B) :: m
INTEGER(I4B) :: nnz
INTEGER(I4B) :: ii
INTEGER(I4B) :: unitno
CHARACTER(1024) :: astr

OPEN (NEWUNIT=unitno, file=rhs_name, action="READ", status="OLD")
READ (unitno, *) astr
READ (unitno, *) n, m
CALL Reallocate(rhs, n)
DO ii = 1, n
  READ (unitno, *) rhs(ii)
END DO
CLOSE (unitno)

CALL IMPORT(csrmat, matrix_name, SPARSE_FMT_COO)

n = SIZE(csrmat, 1)
m = SIZE(csrmat, 2)
nnz = GetNNZ(csrmat)
CALL Display(n, "nrow = ")
CALL Display(m, "ncol = ")
CALL Display(nnz, "nnz = ")

CALL Reallocate(sol, n)

! lis

CALL lis_initialize(ierr)

ia = csrmat%csr%ia - 1
ja = csrmat%csr%ja - 1

CALL lis_matrix_create(0, A, ierr)
CALL lis_matrix_set_size(A, 0, n, ierr)
CALL lis_matrix_set_csr(nnz, ia, ja, csrmat%a, A, ierr)
CALL lis_matrix_assemble(A, ierr)

CALL Display(csrmat%a, "a before = ")

CALL lis_matrix_destroy(A, ierr)
CALL lis_finalize(ierr)
END PROGRAM main
