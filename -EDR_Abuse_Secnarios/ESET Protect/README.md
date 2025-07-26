# Summary

ESET allows for instantaneous free trial environments with full featured agents. This platform seemed initially high in abuse potential due to the features available, such as command execution, host isolation, and even full device encryption! These options were tested with other EDRs installed, and did not generate detections.

# Testing Steps

- Go to https://protecthub.eset.com/public/registration?culture=en-US and sign up for a free trail.
- Check your email for a login link, and register your account.
- Login to https://protecthub.eset.com/dashboard, and wait for your ESET Protect license to activate
- Click the ESET Protect hyperlink.
- Navigate to installers > create installer > select group "Lost & Found" > download the sensor.
- Install the sensor on target device (admin required).
- Brick the device by going to Tasks > New Task > Client Task and selecting a task from the drop down, such as "Isolate Computer From Network"
- Then click continue > finish > add trigger, and set the target machine.
- Click Finish and the task will be sent to the target.

# EDR Cannibalism

We also noticed that when installing a new ESET agent, it will completely override any previous installation, even for a different tenant! Doing so does not even trigger any type of alerting in the product, the agent just goes "offline" and starts reporting to the new tenant. This can be accomplished simply by following the above steps to install a new agent on a device that already has it.
