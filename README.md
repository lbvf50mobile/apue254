# Gole of this Project.

Create a GitHub page that maps and adds description to the Stevens&Rago 2.5.4
paragraph sysconf, pathconf, and fpathconf Functions.


## The implementation plan.

1. Create YAML structure of the tables where "Name of limit" would be a keys.
2. Add short LLM generated one paragraph description of each limit.
3. Write Ruby generator that creaed basic HTML layout.
4. Represent that structure to an LLM to get a valid CSS/JS environment for a
   nice representation.
5. Flush the project to the GitHub pages.
