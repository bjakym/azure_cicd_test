# Sample project of usage Terraform Azure CI/CD with remote backend 

## Description

This asset can be used as a sample of managing Azure resources using CI/CD approach. It's utilizing terraform and github actions. State files are stored in remote backend.

## Procedure

- Workflows on Push/Pull/Merge:
```mermaid
flowchart TD
%% https://en.wikipedia.org/wiki/Flowchart
%% https://mermaid.js.org/syntax/flowchart.html
A7 --> B["PR Flow"]
B8 --> C["Merge Flow"]

subgraph A["Push Flow"]
    A1[1. Push Code] --> A2(2. Detect folders of\nchanged TF files)
    A2 --> A3(3. Order folders based on\nresource dependencies)
    A3 --> A4(4. Initialize TF backend)
    A4 --> A5(5. Validate TF code)
    A5 --> A6{6. Errors ?}
    A6 .-> |No| A7(7. Go To PR Flow)
    A6 .-> |Yes| A1
end

subgraph B["PR Flow"]
    B1[7. Pull Request] --> B2(8. Repeat 2, 3, 4)
    B2 --> B3(10. Run TF plan)
    B3 --> B4(11. Add result of every\nTF plan as comment in PR)
    B4 --> B5{12. Approve PR ?}
    B5 .-> |No| B6(13. Stop)
    B5 .-> |Yes| B8(14. Go to Merge Flow)
end

subgraph C["Merge Flow"]
    direction LR
    C1[14. Merge code\nto main branch] --> C2(15. Repeat 2, 3, 4)
    C2 --> C3(15. Run TF apply)
    C3 --> C4(16. Check results) 
end
```