program="nmap -sn "
names=$(hostname -I | tr ' ' '\n')

# echo $names
keys=({1..9} {a..z})

declare -A address_map
key_index=0
echo "Choose a file to open with $program (press the corresponding key):"
# while IFS='' read -r name; do
while IFS='' read -r name; do
  key="${keys[$key_index]}"
  echo "[$key] $name"
  address_map["$key"]="$name"
  key_index=$((key_index + 1))
done <<<"$names"

echo -n "Press the key corresponding to the file you want to open: "

read -n 1 choice
echo

if [ -n "${address_map[$choice]}" ]; then
  echo "Running:"
  echo $program "${address_map[$choice]}/$@"
  $program "${address_map[$choice]}/$@"
else
  echo "Invalid choice."
fi
