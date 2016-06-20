private static boolean changesLine(final GenericTreeNode patternTree, int reportLine) {
	LineNumberFetcher fetcher = new LineNumberFetcher();
	try {
		fetcher.visit(patternTree);
		return fetcher.lines.contains(reportLine);
	} catch (Exception e) {
		return false;
	}
}

private static class LineNumberFetcher implements TreeVisitor {
	Set<Integer> lines = new TreeSet<>();

	@Override
	public void visit(GenericTreeNode genericTreeNode) throws Exception {
		for (GenericTreeNode matchingNode : genericTreeNode.getMatchNodes()) {
			lines.add(matchingNode.getLine());
		}
		for (GenericTreeNode child : genericTreeNode.getChildren()) {
			child.acceptVisitor(this);
		}
	}
}