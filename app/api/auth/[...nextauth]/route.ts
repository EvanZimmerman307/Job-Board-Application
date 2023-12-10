import prisma from "@/lib/prisma";
import { Account, AuthOptions, Profile, Session, User } from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";
import bcrypt from "bcryptjs";
import { JWT } from "next-auth/jwt";
import NextAuth from "next-auth/next";

export const authOptions: AuthOptions = {
  providers: [
    CredentialsProvider({
      name: "Credentials",
      credentials: {
        email: {
          label: "Email",
          type: "text",
          placeholder: "your@email.com",
        },
        password: {
          label: "Password",
          type: "password",
        },
      },
      authorize: async (
        credentials: Record<"email" | "password", string> | undefined
      ) => {
        if (!credentials) {
          return null;
        }

        const { email, password } = credentials;
        const user = await prisma.candidate.findUnique({
          where: { email },
        });

        if (!user) {
          return null;
        }

        const userPassword = user.passwordHash;
        const isValidPassword = bcrypt.compareSync(password, userPassword);
        if (!isValidPassword) {
          return null;
        }

        return {
          id: user.candidateID.toString(), // update this line to use candidateId instead of id
          name: user.fullName,
          email: user.email,
          candidateId: user.candidateID,
        } as User;
      },
    }),
  ],
  pages: {
    signIn: "/auth/signin",
    signOut: "/auth/signout",
  },
  secret: process.env.NEXTAUTH_SECRET as string,
  session: {
    strategy: "jwt",
    maxAge: 30 * 24 * 60 * 60, // 30 days
    updateAge: 24 * 60 * 60, // 24 hours
  },
  callbacks: {
    async session(params: { session: Session; token: JWT; user: User }) {
      if (params.session.user) {
        params.session.user.email = params.token.email;
      }

      return params.session;
    },
    async jwt(params: {
      token: JWT;
      user?: User | undefined;
      account?: Account | null | undefined;
      profile?: Profile | undefined;
      isNewUser?: boolean | undefined;
    }) {
      if (params.user) {
        params.token.email = params.user.email;
      }

      return params.token;
    },
  },
};

const handler = NextAuth(authOptions);

export { handler as GET, handler as POST };
