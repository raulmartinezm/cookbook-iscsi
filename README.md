# iscsi-cookbook

Chef cookbook that installs and configures Open-iSCSI for Debian/Ubuntu Linux based systems.

## Tested Platforms

- Debian 7.8 (Wheezy)
- Ubuntu 12.04
- Ubuntu 14.04

## Attributes

### target


### initiator



## Usage

### iscsi::target

Include `iscsi` in your target (server) node's `run_list`:

```json
{
  "run_list": [
    "recipe[iscsi::target]"
  ]
}
```

### iscsi::initiator

Include `iscsi` in your initiator (client) node's `run_list`:

```json
{
  "run_list": [
    "recipe[iscsi::initiator]"
  ]
}
```

Discover iSCSI target:

    $ sudo iscsiadm -m discovery -t sendtargets -p 192.168.33.100


## License and Authors

Copyright 2015, Raul Martinez

Licensed under the Apache License, Version 2.0 (the 'License'); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an 'AS IS' BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

Author:: Raul Martinez (<raul.martinez07@alu.umh.es>)
