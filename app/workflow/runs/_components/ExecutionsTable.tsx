"use client";

import { GetWorkflowExecutions } from "@/actions/workflows/getWorkflowExecutions";
import { Table, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { useQuery } from "@tanstack/react-query";
import React from "react";

type InitialDataType = Awaited<ReturnType<typeof GetWorkflowExecutions>>;

function ExecutionsTable({
  workflowId,
  initialData,
}: {
  workflowId: string;
  initialData: InitialDataType;
}) {
  const query = useQuery({
    queryKey: ["executions", workflowId],
    initialData,
    queryFn: () => GetWorkflowExecutions(workflowId),
    refetchInterval: 5000,
  });
  return (
    <div className="border rounded-lg shadow-md overflow-auto">
      <Table className="h-full">
        <TableHeader className="bg-muted">
          <TableRow>
            <TableHead>Id</TableHead>
            <TableHead>Id</TableHead>
            <TableHead>Id</TableHead>
            <TableHead>Id</TableHead>
          </TableRow>
        </TableHeader>
      </Table>
    </div>
  );
}

export default ExecutionsTable;
