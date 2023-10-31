import sys

version = sys.version
if version.startswith("3.9"):
    print("\n\033[32mHello from python script runned from Docker container!\033[0m")
    print("Python version:", sys.version)
    print("\n")
else:
    print("\n\033[33mHello from python script runned localy!\033[0m")
    print("Python version:", sys.version)
    print("\n")
