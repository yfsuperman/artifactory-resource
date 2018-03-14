#!/usr/bin/env bats

@test "applyRegex_version returns version" {
  source assets/common.sh

  export regex="myapp-(?<version>.*).txt"
  export file_name="myapp-0.1.1.txt"

  run applyRegex_version "$regex" "$file_name"
  [ "$status" -eq 0 ]
  [ "$output" = "0.1.1" ]
}

@test "get_current_version returns expected version" {
  source assets/common.sh

  export regex="myapp-(?<version>.*).txt"
  export expected_output=$(cat ./test/data/sample_folder_contents01_version_output.txt)

  run get_current_version "$regex" "$(cat ./test/data/sample_folder_contents01.txt)"

  [ "$status" -eq 0 ]
  [ "$output" = "$expected_output" ]
  # [ "$result" -eq 4 ]
}

@test "get_current_version returns expected version for dotted numbers" {
  source assets/common.sh

  export regex="bosh_v(?<version>.*).yml"
  export expected_output=$(cat ./test/data/sample_folder_contents01_v_version_output.txt)

  run get_current_version "$regex" "$(cat ./test/data/sample_folder_contents01.txt)"

  [ "$status" -eq 0 ]
  [ "$output" = "$expected_output" ]
  # [ "$result" -eq 4 ]
}

@test "get_all_versions returns expected version" {
  source assets/common.sh

  export regex="myapp-(?<version>.*).txt"
  export expected_output=$(cat ./test/data/sample_folder_contents01_allversions_output.txt)

  run get_all_versions "$regex" "$(cat ./test/data/sample_folder_contents01.txt)"

  [ "$status" -eq 0 ]
  [ "$output" = "$expected_output" ]
  # [ "$result" -eq 4 ]
}

@test "get_files returns expected content" {
  source assets/common.sh

  export regex="myapp-(?<version>.*).txt"
  export expected_output=$(cat ./test/data/sample_folder_contents01_files_output.txt)

  run get_files "$regex" "$(cat ./test/data/sample_folder_contents01.txt)"

  [ "$status" -eq 0 ]
  [ "$output" = "$expected_output" ]
  # [ "$result" -eq 4 ]
}
