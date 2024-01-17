import argparse

def parse_input(input_string):
    # Split the input string into a list of folder paths
    return input_string.split()

def order_folders(input_list):
    # Dictionary to store folders based on length and last child name
    ordered_folders = {}

    for folder in input_list:
        # Split folder path into parts using '/'
        parts = folder.split('/')
        length = len(parts)
        last_child_name = parts[-1]

        # Initialize the dictionary if the length is not present
        if length not in ordered_folders:
            ordered_folders[length] = {}

        # Add folder to the corresponding length and last child name
        if last_child_name not in ordered_folders[length]:
            ordered_folders[length][last_child_name] = [folder]
        else:
            ordered_folders[length][last_child_name].append(folder)

    return ordered_folders

def display_output(ordered_folders):
    # Initialize order level
    order_lvl = 0

    # Iterate through lengths in sorted order
    for length in sorted(ordered_folders.keys()):
        folders_at_level = ordered_folders[length]

        # Iterate through last child names in sorted order
        for last_child_name in sorted(folders_at_level.keys()):
            folders = folders_at_level[last_child_name]
            folders.sort()

            # Increment order level and display output
            order_lvl += 1
            print("{}: {}".format(order_lvl, folders))

def main():
    # Parse command line arguments
    parser = argparse.ArgumentParser(description="Order folders based on specified criteria.")
    parser.add_argument("input_string", type=str, help="Input string of folder paths separated by space.")
    args = parser.parse_args()

    # Parse input string into a list
    input_list = parse_input(args.input_string)

    # Order folders based on length and last child name
    ordered_folders = order_folders(input_list)

    # Display the ordered folders with order levels
    display_output(ordered_folders)

if __name__ == "__main__":
    main()
