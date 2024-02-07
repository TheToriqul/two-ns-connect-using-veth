## Network Namespace Isolation with Veth Interfaces

This script creates two isolated network environments, named "red" and "blue", using Linux network namespaces and virtual ethernet (veth) interfaces. Each namespace operates independently with its own IP address and routing table, preventing network traffic from interfering with each other.

**Key Steps:**

1. **Create Namespaces:** Two separate namespaces, "red" and "blue", are created using `ip netns`.
2. **Establish Connection:** A veth pair interface ("tap1" and "tap2") is created, acting as a virtual bridge between the namespaces.
3. **Assign Interfaces:** Each veth interface is moved to its respective namespace ("tap1" to "red" and "tap2" to "blue").
4. **Activate Interfaces:** Both interfaces within each namespace are brought up (activated) using `ip link set dev tapX up`.
5. **Configure IP Addresses:** Each namespace receives a unique IP address within the 192.168.1.X subnet.
6. **Test Connectivity:** Pings are sent from each namespace to the other's IP address, verifying successful communication.
7. **Optional Cleanup:** Instructions are provided to remove the created namespaces using `ip netns del`.

**Benefits:**

- Isolates network traffic for security and testing purposes.
- Simulates multiple network segments within a single system.
- Useful for containerization and virtual environments.

**Contact:**

Feel free to reach out to `toriqul.int@gmail.com` for further questions or clarifications.





`




`


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
