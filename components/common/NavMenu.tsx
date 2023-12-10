"use client";
import Link from "next/link";
import AuthText from "./AuthText";
import { useSession } from "next-auth/react";
import { Button } from "@/components/ui/button";
export default function NavMenu() {
  const { data: session } = useSession();

  return (
    <div className="fixed top-0 left-0 right-0 bg-white z-10">
      <div className="navbar bg-base-100 ">
        <div className="navbar-start">
          <div className="dropdown">
            <label tabIndex={0} className="btn btn-ghost lg:hidden">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                className="h-5 w-5"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth="2"
                  d="M4 6h16M4 12h8m-8 6h16"
                />
              </svg>
            </label>
            <ul
              tabIndex={0}
              className="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-52"
            >
              <ul className="p-2 bg-white">
                <li>
                  <Link href="/jobs">Jobs</Link>
                </li>
                <li tabIndex={0}>
                  <details>
                    <summary>Profile</summary>
                    <ul className="p-2">
                      <li>
                        <h1 className="font-bold">
                          {session ? session?.user?.email : "Guest"}
                        </h1>
                      </li>
                      <hr />
                      <li>
                        <a>Submenu 2</a>
                      </li>
                    </ul>
                  </details>
                </li>
              </ul>
            </ul>
          </div>
          <Link href="/" className="btn btn-ghost normal-case text-xl">
            FootStomp
          </Link>
        </div>
        <div className="navbar-center hidden lg:flex">
          <ul className="menu menu-horizontal px-1">
            <li>
              <Link href="/jobs">Jobs</Link>
            </li>
            <li tabIndex={0}>
              <details>
                <summary>Profile</summary>
                <ul className="p-2 bg-white">
                  <Link href={"/profile"}>
                    <li>
                      <h1 className="font-bold">
                        {session ? session?.user?.name : "Guest"}
                      </h1>
                    </li>
                  </Link>
                  <hr />
                  <li>
                    <a>Submenu 2</a>
                  </li>
                </ul>
              </details>
            </li>
          </ul>
        </div>
        <div className="navbar-end">
          {!session && (
            <Button className="btn">
              <Link href="/auth/signup">Sign Up</Link>
            </Button>
          )}
          <Button className="btn ">
            <AuthText session={session} />
          </Button>
        </div>
      </div>
      <hr />
    </div>
  );
}
