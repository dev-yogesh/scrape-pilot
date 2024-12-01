/*
  Warnings:

  - Added the required column `name` to the `ExecutionPhase` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ExecutionPhase" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userId" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "node" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "startedAt" DATETIME,
    "completedAt" DATETIME,
    "inputs" TEXT,
    "outputs" TEXT,
    "creditsCost" INTEGER,
    "WorkflowExecutionId" TEXT NOT NULL,
    CONSTRAINT "ExecutionPhase_WorkflowExecutionId_fkey" FOREIGN KEY ("WorkflowExecutionId") REFERENCES "WorkflowExecution" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_ExecutionPhase" ("WorkflowExecutionId", "completedAt", "creditsCost", "id", "inputs", "node", "number", "outputs", "startedAt", "status", "userId") SELECT "WorkflowExecutionId", "completedAt", "creditsCost", "id", "inputs", "node", "number", "outputs", "startedAt", "status", "userId" FROM "ExecutionPhase";
DROP TABLE "ExecutionPhase";
ALTER TABLE "new_ExecutionPhase" RENAME TO "ExecutionPhase";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;