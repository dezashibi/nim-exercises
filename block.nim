block myblock:
    echo "entering block"
    while true:
        echo "looping"
        break # leaves the loop, but not the block
    echo "still in block"
echo "outside the block"

block myblock2:
    echo "entering block"
    while true:
        echo "looping"
        break myblock2 # leaves the block (and the loop)
    echo "still in block" # it won't be printed
echo "outside the block"

echo "Hello block arg ":
    let a = "Wor"
    let b = "ld!"
    a & b
