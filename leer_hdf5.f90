program leer_hdf5
  use hdf5
  implicit none

  integer(HID_T) :: file_id, dset_id
  integer :: error
  real(8), dimension(5) :: datos
  integer(HSIZE_T), dimension(1) :: dims

  dims = 5

  call h5open_f(error)

  call h5fopen_f("datos.h5", H5F_ACC_RDONLY_F, file_id, error)
  call h5dopen_f(file_id, "mi_dataset", dset_id, error)
  call h5dread_f(dset_id, H5T_NATIVE_DOUBLE, datos, dims, error)

  print *, "Datos leídos:", datos

  call h5dclose_f(dset_id, error)
  call h5fclose_f(file_id, error)
  call h5close_f(error)

end program leer_hdf5
