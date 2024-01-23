# Ansible Playbook Itm Configure Agent

## Synopsis

This role reconfigure ITM where it is offline on the target host.

<br>

## Variables

| Name | Version added | Type | Required | Description |
| :--- | :---: | :---: | :---: | :--- |
| `affected_host` | `1.0.0` | `str` | `yes` | Pattern to define the hosts and/or groups in Ansible inventory you want to execute against. |

<br>

## Results from execution

| Name | Version added | Type | Returned | Description |
| :--- | :---: | :---: | :---: | :--- |
| `component_output` | `1.0.0` | `JSON` | `always` | Return the results of processes execution.<br>Sample:<br>`None` |
| `status` | `1.0.0` | `str` | `always` | Execution status. |

<br>

| status | rc_number | rc_group | rc_support | rc_message |
| :--- | :---: | :---: | :---: | :--- |
| `OK` | `-` | `-` | `-` |  |
| `Unreachable` | `100` | `connection_issue` | `account` | Connectivity problems |
| `NOK - Parameter` | `400` | `misconfiguration` | `account` | Incorrect input parameter |
| `NOK - Service` | `500` | `service_issue` | `undetermined` | Problem with external service |
| `NOK - Unsupported` | `600` | `unsupported_platform` | `account` | Unsupported platform |
| `NOK - Pre-requirements` | `700` | `prerequisite` | `account` | Install or upgrade Ansible interpreter (Python/PowerShell) |

## Procedure

The IThe ITM Configure automation called as itm_configure_agent.yml is designed to reconfigure the ITM Agent on remote hosts
while handling connectivity issues and reporting the execution results.
After the reconfigure of ITM agent, it sends the success message and, in case of any error, informs with the output message
It includes different roles depending on the operating system (itm_configure_aix, itm_configure_linux and itm_configure_windows,
itm_configure_oracle, itm_configure_sap) and generates output based on the success or failure of the tasks.
<br>

- Workflow:

```mermaid
flowchart TD
%% https://en.wikipedia.org/wiki/Flowchart
%% https://mermaid.js.org/syntax/flowchart.html
  Ansible([Ansible]) --> connection{Established a connection to Endpoint ?}

  connection .-> connection_failure[/Connection failure/] .-> Unreacheable[/Unreacheable/]
  connection .-> interpreter_role[/Interpreter Fail/] .-> Unreacheable

  connection --> Connected[/Connected/]
  Connected --> os_type{os_type?}
  os_type .-> Linux[linux_config]
  os_type .-> Aix[aix_config]
  os_type .-> Oracle[oracle_config]
  os_type .-> Sap[sap_config]
  os_type .-> Windows[windows_config]
  Linux .-> Report_Execution
  Aix.-> Report_Execution
  Windows.-> Report_Execution
  Oracle.-> Report_Execution
  Sap.-> Report_Execution
```

<br>

## Examples

[itm_configure_agent.yml](itm_configure_agent.yml)

<br>

## Support

- [Help & Support - Bugs and Features Requests](https://kyndryl.sharepoint.com/sites/Strategic-Markets-Innovate/SitePages/support.aspx)

<br>

## Deployment

- Please fill out [this form](https://kyndryl.sharepoint.com/sites/Strategic-Markets-Innovate/SitePages/support.aspx) for deployment/enablement request.

<br>

## Known problems and limitations

_No known problems and limitations as of know within the scope of this automation._
_All Supported Operating Systems non-EOL versions below are supported._

- AIX, Linux, UNIX, and Windows.

<br>

## Prerequisites

Ansible Galaxy dependencies:

- [ansible_role_interpreter](https://github.kyndryl.net/la-innovation/ansible_role_interpreter)
- [ansible_role_script_runner](https://github.kyndryl.net/la-innovation/ansible_role_script_runner)
- [ansible_role_ssh_tunnel](https://github.kyndryl.net/la-innovation/ansible_role_ssh_tunnel)

Python packages required:
None.

GitHub Instructions:

- [Branch Name Policy](https://github.kyndryl.net/la-innovation/ansible_role_template/blob/main/BRANCH_POLICY.md)
- [Conventional Commit Spec](https://github.kyndryl.net/la-innovation/ansible_role_template/blob/main/CONVENTIONAL_COMMIT.md)

<br>

## License

[Kyndryl Intellectual Property](https://github.kyndryl.net/Continuous-Engineering/CE-Documentation/blob/master/files/LICENSE.md)

Copyright &copy; Kyndryl Inc. 2023. All Rights Reserved.