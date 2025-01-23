#!/usr/bin/env python

# External proxy hardcoded for UNB
# fcslinux.cs.unb.ca
proxy_url = "fcslinux.cs.unb.ca"

# https://www.cs.unb.ca/help/ssh-help.shtml
# Remote Labs - 70 machines (remotelabm01 - remotelabm70)
# GC112 - 70 machines (gc112m01 - gc112m70)
# GC127A - 15 machines (gc127m01 - gc127m15)
# GD124 - 10 machines (gd124m01 - gd124m10)
# ITD414 - 50 machines (id414m01 - id414m50)
# ITD415 - 50 machines (id415m01 - id415m50)

# prefix: range
machines = {
    "remotelabm": 70,
    "gc112m": 70,
    "gc127m": 15,
    "gd124m": 10,
    "id414m": 50,
    "id415m": 50,
}

# Username of UNB FCS account
username = "ishoebot"

# Example of a config unit
# Host remotelabm01.cs.unb.ca
# \tUser <username>
# \tProxyJump <proxy_url>

# Write the config units to a file named config_unb
# with open("config_unb", "w") as f:
# 	for prefix, count in machines.items():
# 		for i in range(1, count + 1):
# 			# Make sure index is 2 digit padded with 0
# 			index = str(i).zfill(2)
# 			f.write(f"Host {prefix}{index}.cs.unb.ca\n")
# 			f.write(f"\tUser {username}\n")
# 			f.write(f"\tProxyJump {proxy_url}\n")

# For tab completion
with open("unb_hosts", "w") as f:
	for prefix, count in machines.items():
		for i in range(1, count + 1):
			# Make sure index is 2 digit padded with 0
			index = str(i).zfill(2)
			f.write(f"Host {prefix}{index}.cs.unb.ca\n")