import { getServerSession } from "next-auth";
import { authOptions } from "./api/auth/[...nextauth]/route";
import prisma from "@/lib/prisma";

export default async function Home() {
  const session = await getServerSession(authOptions);

  if (session?.user?.email) {
    const candidate = await prisma.candidate.findUnique({
      where: {
        email: session.user.email,
      },
    });
    const candidateId = candidate?.candidateID;
    console.log(candidateId);
  }

  return (
    <div className="relative flex flex-col justify-center items-center h-screen overflow-hidden">
      {session?.user?.email ? (
        <div>Welcome back {session.user.name}, view jobs!</div>
      ) : (
        <div>Log in to view jobs</div>
      )}
    </div>
  );
}
