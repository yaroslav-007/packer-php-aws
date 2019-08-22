
# Simple packer code that creates AWS AMI with nginx and php installed
This is project that creates AWS AMI with nginx and php installed.

## Pre-requirements

**Install Packer:**
Download and install accordingly to your OS as described here:
https://www.packer.io/downloads.html

**Install rbenv:**


On Linux:
> Note:
> On Graphical environments, when you open a shell, sometimes `~/.bash_profile` doesn't get loaded
> You may need to `source ~/.bash_profile` manually or use `~/.bashrc`

```
apt update
apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```
On MacOS:
```
brew install rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```

On Windows:
Install accordingly to https://rubyinstaller.org/

## How to run the code


 OS system | Operation
 ------------ | -------------
| Windows | Start menu -> Run and type cmd |
| Linux  |Start terminal |
| macOS | Press Command - spacebar to launch Spotlight and type "Terminal," then double-click the search result. |

## Clone the code locally:

    git clone https://github.com/yaroslav-007/packer-php-aws
    cd packer-php-aws


## Populate secrets and specifics:

 - Put your **access_key** and **secret_key** in ** template.json** 
 - Put **AMI ID**  of the image packer will create in **.kitchen.yml**
 - Put the ssh path to the ssh key that is set with the instance



## Start terraform:

      packer build template


 

When packer finished there will be AMI image created in AWS with outputed ID.

## Kitchen test
### Pre-requirements
```
rbenv install 2.5.1
rbenv local 2.5.1
rbenv versions
gem install bundler
bundle install
```

  

### Build

```
make
```

### Test
```
bundle exec kitchen converge
bundle exec kitchen verify
bundle exec kitchen destroy
```

You should get:

```
Profile: default
Version: (not specified)
Target:  ssh://ubuntu@35.175.151.44:22
  ubuntu
     ✔  should eq "ubuntu"
  18.04
     ✔  should eq "18.04"
  System Package nginx
     ✔  should be installed
  System Package php-fpm
     ✔  should be installed
  Service php7.2-fpm
     ✔  should be installed
     ✔  should be enabled
     ✔  should be running
  Service nginx
     ✔  should be installed
     ✔  should be enabled
     ✔  should be running


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 10 successful, 0 failures, 0 skipped
       Finished verifying <default-ubuntu> (0m11.16s).
-----> Kitchen is finished. (0m12.52s)
```
