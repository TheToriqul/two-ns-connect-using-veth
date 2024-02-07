# This script configures two network namespaces named "red" and "blue" using virtual ethernet (veth) interfaces. Here's a breakdown of the steps:

**1. Creating Namespaces:**

- `sudo ip netns add red`: Creates a network namespace named "red".
- `sudo ip netns add blue`: Creates a network namespace named "blue".

**2. Creating Veth Pair:**

- `sudo ip link add tap1 type veth peer name tap2`: Creates a veth pair interface. "tap1" and "tap2" act as virtual ethernet devices at each end of the link.

**3. Moving Interfaces to Namespaces:**

- `sudo ip link set tap1 netns red`: Moves the "tap1" interface to the "red" namespace.
- `sudo ip link set tap2 netns blue`: Moves the "tap2" interface to the "blue" namespace.

**4. Bringing Up Interfaces:**

- `sudo ip netns exec red ip link set dev tap1 up`: Brings up the "tap1" interface inside the "red" namespace.
- `sudo ip netns exec blue ip link set dev tap2 up`: Brings up the "tap2" interface inside the "blue" namespace.

**5. Assigning IP Addresses:**

- `sudo ip netns exec red ip addr add 192.168.1.1/24 dev tap1`: Assigns IP address 192.168.1.1/24 to the "tap1" interface in the "red" namespace.
- `sudo ip netns exec blue ip addr add 192.168.1.2/24 dev tap2`: Assigns IP address 192.168.1.2/24 to the "tap2" interface in the "blue" namespace.

**6. Testing Connectivity:**

- `sudo ip netns exec red ping 192.168.1.2`: Pings the "blue" namespace (192.168.1.2) from the "red" namespace.
- `sudo ip netns exec blue ping 192.168.1.1`: Pings the "red" namespace (192.168.1.1) from the "blue" namespace.

**7. Cleaning Up (Optional):**

- The commented lines provide instructions to remove the created namespaces using `sudo ip netns del red` and `sudo ip netns del blue`.

**Overall, this script sets up two isolated network environments using namespaces and allows communication between them through the assigned IP addresses.**

# Do you have any further questions about specific parts of the script or its functionality?
## Please feel free to contact me through email: - `toriqul.int@gmail.com`
