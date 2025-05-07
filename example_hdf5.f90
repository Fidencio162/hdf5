program escribir_hdf5
  use hdf5
  implicit none

  integer(HID_T) :: file_id, dset_id, dataspace_id
  integer(HSIZE_T), dimension(1) :: dims
  integer :: error
  real(8), dimension(5) :: datos = [1.0d0, 2.0d0, 3.0d0, 4.0d0, 5.0d0]

  dims = 5

  call h5open_f(error)

  ! Crear archivo
  call h5fcreate_f("datos.h5", H5F_ACC_TRUNC_F, file_id, error)

  ! Crear dataspace
  call h5screate_simple_f(1, dims, dataspace_id, error)

  ! Crear dataset
  call h5dcreate_f(file_id, "mi_dataset", H5T_NATIVE_DOUBLE, dataspace_id, dset_id, error)

  ! Escribir datos
  call h5dwrite_f(dset_id, H5T_NATIVE_DOUBLE, datos, dims, error)

  ! Cerrar objetos
  call h5dclose_f(dset_id, error)
  call h5sclose_f(dataspace_id, error)
  call h5fclose_f(file_id, error)
  call h5close_f(error)

end program escribir_hdf5
