

## Manual Workflow (On Dispatch)

```mermaid
flowchart TD
%% https://en.wikipedia.org/wiki/Flowchart
%% https://mermaid.js.org/syntax/flowchart.html

flowchart TD
    A1[Start] --> A2(Provide Inputs:\n-TF Folder\n-Action\n-Recursive)
    A2 --> A3(Execute Workflow)
    A3 --> A4(Order TF sub-folders\nbased on resource dependencies)
    A4 --> A5(Initialize TF backend)
    A5 --> A6(Validate TF Code)
    A6 --> A7{Errors ?}
    A7 .-> |No| A8(Run specified TF action:\nplan/apply/destroy)
    A7 .-> |Yes| A9(Stop the flow)
```