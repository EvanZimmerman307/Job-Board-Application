export { default } from "next-auth/middleware";

export const config = { matcher: ["/jobs/:path*", "/myjobs/:path*"] };
