import convert_nfp
import asyncio
import websockets

#call img_to_nfp to create file with name frame.nfp in mainloop load img_to_nfp then
#display repeat for each frame	


async def send_frame(websocket):
    name = await websocket.recv()
    print(f"<<< {name}")
    greeting = f"Hello {name}!"
    await websocket.send(greeting)
    print(f">>> {greeting}")

async def main():
    async with websockets.serve(send_frame, "localhost", 8765):
        await asyncio.Future()

if __name__ == "__main__":
    asyncio.run(main())