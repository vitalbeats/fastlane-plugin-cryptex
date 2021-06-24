# IMPORTANT NOTE: PAY ATTENTION

This is a fork that adds a fix to avoid the process to hang in the step `origin list` when fastlane runs.

Because the proposed fix (this fork only applies it) hasn't been merged and the fix is important and try to create a different gem just to apply that fix is too cumbersome and unnecessary following steps must be done in VB project to make it work.

## references

- [PR 20](https://github.com/hjanuschka/fastlane-plugin-cryptex/pull/20)

## REQUIREMENT

- ruby 2.6.5 (ruby 2.6.1 in Big Sur has issues with thor when `rake` is executed)

## STEPS before going back to project

Before going back to project and to use the gem created in this step some manual actions must be done.

1. delete any fastlane-plugin-cryptex gem installed
```
$> gem uninstall fastlane-plugin-cryptex
$> bundle remove fastlane-plugin-cryptex
```

2. execute:
```
$> bundle install
$> rake install
```

NOW YOU CAN GO BACK TO THE PROJECT KNOWING THE GEM IS INSTALLED

# ==================

# Cryptex for fastlane

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-cryptex)

<img src='https://upload.wikimedia.org/wikipedia/commons/4/42/Cryptex.jpg'>

## About cryptex

Manage files - crypted - in a git repository.
adds fastlane actions, and also ships a `cryptex` binary.


 * all kinds of files
 * `ENV` variables


## Setup

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-cryptex`, add it to your project by running:

```bash
fastlane add_plugin cryptex
```

## Example

```ruby

lane :test do
  # Generate a new Android Keystore
  
  cryptex_generate_keystore(
    destination: "sample.keystore",
    fullname: "Helmut Januschka",
    city: "Vienna",
    alias: "releaseKey"
  )

  # import/update this in cryptex
  cryptex(
    type: "import",
    in: "sample.keystore",
    key: "my_awesome_app_production"
  )

  # export a file from cryptex
  cryptex(
    type: "export",
    out: "releaseKey.keystore",
    key: "my_awesome_app_production"
  )

  file_output = File.read("../releaseKey.keystore")
  puts "File Content: #{file_output.tr("\n", ' ')}"

  # delete the file
  cryptex(
    type: "delete",
    key: "my_awesome_app_production"
  )

  # Nukes all files
  cryptex(
    type: "nuke"
  )
  
  
  #ENV SAMPLES
  #import some env into the space of `my_group`
  cryptex(
    type: "import_env",
    hash: {
      "helmut" => "go",
      "some_url" =>  "http://lets.do.it"
    },
    key: "my_group"
  )
  env_out = cryptex(
    type: "export_env",
    key: "my_group",
    set_env: true #THIS one sets the values found directly into to ENV
    #hash: {"my_key"=>true, "some_url"=>true} # only returned specific keys
  )
  
  puts "IN ENV it is:"
  puts ENV['some_url']
  puts "returned: #{env_out.inspect}"
  
end


```

## Commandline Examples:

```bash
#init
cryptex init

# import file
cryptex -s import -i file_to_hide.txt -k file_key

# export file
cryptex -s export -k file_key -o file_to_hide.txt

#delete file
cryptex -s delete -k file_key

#nuke repo
cryptex nuke


```


## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.


## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Plugins.md).

