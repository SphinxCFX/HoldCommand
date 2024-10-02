# Hold and Unhold Commands for Admins

This resource provides `/hold <id>` and `/unhold <id>` commands for server administrators in FiveM. The `/hold` command allows admins to hold a player at a specified location, while the `/unhold` command releases them. These commands are particularly useful for managing players during admin tasks.

## Features

- **Hold a Player**: Use `/hold <id>` to hold a specified player at the position of the admin who issued the command.
- **Release a Player**: Use `/unhold <id>` to release the held player.
- **ACE Permissions**: The commands are secured with ACE permissions to ensure only authorized users can execute them.

## Installation

1. **Download the Resource**: Clone or download this repository to your server's resources folder.

2. **Add to `server.cfg`**:
   Ensure that your resource is started by adding the following line to your `server.cfg`:
   start your_resource_name
Add ACE Permissions: To use the /hold and /unhold commands, you'll need to set up ACE permissions in your server.cfg. Here’s how to do it:


Copy code
add_ace group.admin hold.admin allow
This command gives all users in the admin group permission to use the hold commands. Make sure you replace group.admin with the appropriate group or user you want to grant permissions to.

Usage
To hold a player:


Copy code
/hold <player_id>
To release a player:


/unhold <player_id>
Example
Holding a player with ID 5:

/hold 5
Releasing the player:


/unhold 5
Contact
If you have any questions or need further assistance, feel free to reach out:

Author: SphinxCFX
Email: sphinxcfxdev@gmail.com
Location: Australia
License
This project is licensed under the MIT License. See the LICENSE file for details.



### Instructions for Use
- Replace `your_resource_name` with the actual name of your resource folder in the installation section.
- You can modify the license section if you want to use a different license for your project.

This single markdown document should serve as a comprehensive guide for users of your script. Let me know if you need any further modifications or additional information!
