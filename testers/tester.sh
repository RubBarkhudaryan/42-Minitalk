#!/bin/sh

CLIENT="./client"

# Check if client executable exists
if [ ! -f "$CLIENT" ]; then
    echo "Error: client program '$CLIENT' not found."
    exit 1
fi

# Read server PID
printf "Enter your SERVER PID: "
read SERVER_PID

# Validate PID
if ! kill -0 "$SERVER_PID" 2>/dev/null; then
    echo "Error: Server with PID $SERVER_PID is not running."
    exit 1
fi

# Loop over 100 hardcoded messages (using a here document)
i=1
while IFS= read -r msg; do
    echo "Sending #$i: $msg"
    $CLIENT "$SERVER_PID" "$msg" &
    i=$((i + 1))
    sleep 0.1
done <<EOF
Message 1: Hello there!
Message 2: Just checking in, hope everything's going well.
Message 3: The sun is shining and it’s a beautiful day!
Message 4: Bash scripting is pretty powerful, huh?
Message 5: Have you tried debugging with echo statements?
Message 6: Keep your spirits high and code clean!
Message 7: Server communication test in progress.
Message 8: A watched pot never boils — unless you're multitasking.
Message 9: Let's see if this message makes it through.
Message 10: Can you read me, server?
Message 11: This is a longer message to test buffer handling properly.
Message 12: How many characters can we send before it breaks?
Message 13: Unicode: 🌍🚀✨
Message 14: The quick brown fox jumps over the lazy dog.
Message 15: Stay hydrated and take breaks while coding!
Message 16: Test message sixteen coming through.
Message 17: Ping pong! Just bouncing messages around.
Message 18: This one’s for science.
Message 19: The matrix has you... follow the white rabbit.
Message 20: 🧪 Test message number twenty with emojis.
Message 21: This is an important test to see if messages are received in order.
Message 22: Random thoughts make great test cases.
Message 23: Don't forget to check your semicolons.
Message 24: The cake is a lie.
Message 25: Sending a short burst now.
Message 26: Another ping in the timeline.
Message 27: Can you handle this speed?
Message 28: Client #28 reporting in.
Message 29: This is going smoother than expected.
Message 30: Debugging makes perfect.
Message 31: What happens if we flood it?
Message 32: Are you still with me?
Message 33: Almost a third of the way there!
Message 34: Hello world, again.
Message 35: This is your friendly neighborhood tester.
Message 36: Is it okay if I send more?
Message 37: Checking throughput limits.
Message 38: High-volume message traffic incoming.
Message 39: Let’s overload the buffer. Just kidding.
Message 40: Server, you awake?
Message 41: Just keep sending, just keep sending.
Message 42: The answer to life, the universe and everything.
Message 43: Simulating network chatter.
Message 44: Quick test to ensure stability.
Message 45: We’re halfway through.
Message 46: Buffer management is key.
Message 47: Clean, compact code = less stress.
Message 48: Almost there.
Message 49: This is only a test.
Message 50: Halfway mark!
Message 51: Now begins the second half.
Message 52: Try not to crash the server.
Message 53: Efficiency check in progress.
Message 54: We do a little scripting.
Message 55: Every message matters.
Message 56: Unique message ID 56.
Message 57: No two messages are alike!
Message 58: Consider this a stress test.
Message 59: Fire and forget!
Message 60: If this works, we’re golden.
Message 61: Another successful dispatch.
Message 62: No errors yet.
Message 63: Code smarter, not harder.
Message 64: Background jobs galore.
Message 65: Keep your logs clean.
Message 66: Test message with a quote: “Stay strong.”
Message 67: Wonder if it’s still holding up?
Message 68: I believe in you, little server.
Message 69: Things are heating up!
Message 70: We're on the home stretch!
Message 71: Just another data packet.
Message 72: Closing in on 100!
Message 73: Tests like these make good practice.
Message 74: Server seems happy.
Message 75: Testing emoji load 🐧
Message 76: Long message time — this one goes on a bit more than the others to test larger buffer scenarios.
Message 77: If it breaks, we learn.
Message 78: Calm before the storm.
Message 79: Messages are still unique, promise!
Message 80: Almost at the end!
Message 81: UTF-8 💯 test message.
Message 82: This one’s special… just because.
Message 83: And then there were 83.
Message 84: You made it this far!
Message 85: Keep calm and send more.
Message 86: It's not a bug, it's a feature!
Message 87: Who’s counting? Oh, we are.
Message 88: Don't panic.
Message 89: Just a little more now.
Message 90: Big number energy.
Message 91: Echoes in the code.
Message 92: Nearly full capacity!
Message 93: Load testing like champs.
Message 94: Almost... there...
Message 95: Test storm incoming.
Message 96: Few more to go!
Message 97: It’s been a wild ride.
Message 98: Here comes another!
Message 99: Penultimate ping.
Message 100: Final message — we did it!
Message 101: $(python3 generate_text.py)
EOF

# Wait for all background jobs to finish
wait
echo "✅ All 100 unique clients finished."
