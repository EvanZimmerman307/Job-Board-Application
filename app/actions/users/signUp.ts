"use server";

import prisma from "@/lib/prisma";
import bcrypt from "bcryptjs";

export const signUp = async (
  fullName: string,
  mobileNumber: string,
  email: string,
  password: string
) => {
  // Check if user with the same email already exists
  const userExists: any = await prisma.$queryRaw`
    SELECT 1 FROM Candidate WHERE email = ${email}
  `;

  if (userExists.length > 0) {
    return "User with that email already exists.";
  }

  // Hash the password
  const passwordHash = bcrypt.hashSync(password, 10);

  // Begin transaction
  const result = await prisma.$transaction(async (prisma) => {
    // Insert new user
    const newUser = await prisma.$executeRaw`
      INSERT INTO Candidate (fullName, email, passwordHash) VALUES (${fullName}, ${email}, ${passwordHash})
    `;

    // Get the ID of the newly inserted user
    const candidateId: any = await prisma.$queryRaw`
      SELECT LAST_INSERT_ID() as id
    `;

    // Assuming 'mobileNumbers' is a separate table and 'mobileNumber' field should match with 'number' in that table
    // Insert mobile number
    if (candidateId[0]?.id) {
      await prisma.$executeRaw`
        INSERT INTO Candidate_mobileNumber (candidateID, mobileNumber) VALUES (${candidateId[0].id}, ${mobileNumber})
      `;
    }

    return newUser;
  });

  // Check if the transaction was successful
  if (result) {
    return "Successfully created new user!";
  } else {
    return "There was a problem creating the user.";
  }
};
