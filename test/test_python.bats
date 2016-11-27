@test "python is the correct version" {
  run docker run smizy/python:${TAG} python --version
  echo "${output}" 

  [ $status -eq 0 ]
  [ "${lines[0]}" = "Python ${VERSION}" ]
}