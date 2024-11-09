import React from "react";

function page({ params }: { params: { workflowId: string } }) {
  const { workflowId } = params;
  return <div>page</div>;
}

export default page;
