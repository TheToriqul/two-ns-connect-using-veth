#!/bin/bash

# Create network namespaces
sudo ip netns add red
sudo ip netns add blue

# Create veth pair
sudo ip link add tap1 type veth peer name tap2

# Move interfaces to namespaces
sudo ip link set tap1 netns red
sudo ip link set tap2 netns blue

# Bring up interfaces
sudo ip netns exec red ip link set dev tap1 up
sudo ip netns exec blue ip link set dev tap2 up

# Assign IP addresses (adjust as needed)
sudo ip netns exec red ip addr add 192.168.1.1/24 dev tap1
sudo ip netns exec blue ip addr add 192.168.1.2/24 dev tap2

# Print confirmation message
sudo echo "Namespaces and veth pair created successfully!"

# Optional: Test connectivity
sudo ip netns exec red ping 192.168.1.2
sudo ip netns exec blue ping 192.168.1.1

# Clean up (uncomment if you want to remove the namespaces)
# sudo ip netns del red
# sudo ip netns del blue
