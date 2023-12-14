# Mhasan341 Xasset

## How do I install these formulae?

`brew install mhasan341/xasset/xasset`

Or `brew tap mhasan341/xasset` and then `brew install xasset`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

### Usage
Navigate to your project folder where you Assets.xcassets is located, (I'll fix it in later version) and then use the following commands

## List Folders
```bash
xasset
```
This will list all folders with .imageset or .colorset extensions in the default Xcode asset catalog (Assets.xcassets).

## List Folders in a Specific Directory
```bash
xasset -f folder_name
```
Replace folder_name with the name of the directory you want to list.

## List Nested Folders
```bash
xasset -n
```
This will recursively list folders in the specified directory.

## List Folders with Nesting
```bash
xasset -f folder_name -n
```
Combine both options to list nested folders in a specific directory.

## Contributing
If you find any issues or have suggestions for improvements, feel free to open an issue or create a pull request.

## License
This project is licensed under the MIT License.
