import os, sys, json

def scan_terraform_folders(root_folder):
    # Function to count the number of slashes in a folder path
    def count_slashes(folder):
        return folder.count(os.path.sep)

    # Function to define ordering criteria for sorting folders
    def order_criteria(folder):
        parts = folder.split(os.path.sep)
        if parts[-1].isdigit():
            return (count_slashes(folder), int(parts[-1]), parts[-2])
        else:
            return (count_slashes(folder), float('inf'), parts[-1])

    # List to store folders with Terraform files
    terraform_folders = []

    # Traverse the directory tree and find folders with .tf files
    for foldername, subfolders, filenames in os.walk(root_folder):
        if any(filename.endswith('.tf') for filename in filenames):
            terraform_folders.append(foldername)

    # Sort Terraform folders based on the ordering criteria
    terraform_folders.sort(key=order_criteria)

    # Result list to store grouped Terraform folders
    result = []
    current_group = []
    current_criteria = None

    # Group Terraform folders based on ordering criteria
    for folder in terraform_folders:
        folder_criteria = order_criteria(folder)
        if folder_criteria != current_criteria:
            if current_group:
                result.append(current_group.copy())
            current_group = [folder]
            current_criteria = folder_criteria
        else:
            current_group.append(folder)

    # Add the last group to the result list
    if current_group:
        result.append(current_group.copy())

    return result

def join_list(list):
    # Function to join paths in a list and replace backslashes with forward slashes
    list_to_join = []

    for group in list:
        list_str = " ".join(group)
        list_str = list_str.replace('\\','/')
        list_to_join.append(list_str)

    return(list_to_join)
            
if __name__ == "__main__":
    # Check if the correct number of command-line arguments is provided
    if len(sys.argv) != 3:
        print("Usage: python script.py <apply|destroy> <folder_path>")
        sys.exit(1)

    # Extract the Terraform action and folder path from command-line arguments
    tf_action = sys.argv[1]
    folder_path = sys.argv[2]

    # Scan Terraform folders and get the result
    tf_folders = scan_terraform_folders(folder_path)
    
    # Join the result list and replace backslashes with forward slashes
    result = join_list(tf_folders)

    # Print the result as JSON based on the Terraform action
    if tf_action == "plan" or tf_action == "apply":
        print(json.dumps(result))
    elif tf_action == "destroy":
        print(json.dumps(result[::-1]))   
    else:
        print("Error: Wrong action specified. Allowed values are 'apply' or 'destroy'.")
        sys.exit(1)
