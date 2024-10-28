#!/bin/bash

# # Define the target workspace and the window limit
# TARGET_WORKSPACE=2
# WINDOW_LIMIT=3

# # Get the current number of windows in the target workspace
# WINDOW_COUNT=$(hyprctl clients -j | jq "[.[] | select(.workspace.id==$TARGET_WORKSPACE)] | length")

# # Check if the number of windows exceeds the limit
# if [ "$WINDOW_COUNT" -ge "$WINDOW_LIMIT" ]; then
#     echo "Workspace $TARGET_WORKSPACE has reached the window limit of $WINDOW_LIMIT."
#     exit 1
# else
#     # Launch the application passed as argument
#     "$@" &
# fi
#!/bin/bash

# Define the target workspace and the limit of windows


# WINDOW_LIMIT=3

# # Get the current number of windows in the target workspace
# WINDOW_COUNT=$(hyprctl clients -j | jq "[.[] | select(.workspace.id==$TARGET_WORKSPACE)] | length")

# # Check if the number of windows exceeds the limit
# if [ "$WINDOW_COUNT" -ge "$WINDOW_LIMIT" ]; then
#     echo "Workspace $TARGET_WORKSPACE has reached the window limit of $WINDOW_LIMIT."
#     exit 1
# else
#     # Open a new window (for example, open alacritty)
#     $1 &
# fi

TARGET_WORKSPACE=$(hyprctl activeworkspace | grep "workspace ID" | awk '{print $3}')
WINDOW_LIMIT=3

# Get the current number of windows in the target workspace
WINDOW_COUNT=$(hyprctl clients -j | jq "[.[] | select(.workspace.id==$TARGET_WORKSPACE)] | length")

# Check if the number of windows exceeds the limit
if [ "$WINDOW_COUNT" -ge "$WINDOW_LIMIT" ]; then
    echo "Workspace $TARGET_WORKSPACE has reached the window limit of $WINDOW_LIMIT."
    exit 1
else
    # Set the active workspace to the target workspace if limit is not reached
    $1 &
fi

