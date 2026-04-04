# Skill Data Schemas

## evals.json

Used to store test cases and assertions for a skill.

```json
{
  "skill_name": "your-skill-name",
  "evals": [
    {
      "id": 1,
      "prompt": "The exact user prompt to test",
      "expected_output": "Plain-language description of what correct output looks like",
      "files": ["path/to/input/file.pdf"],
      "assertions": [
        {
          "id": "a1",
          "text": "Output file is a valid .docx",
          "type": "programmatic"
        },
        {
          "id": "a2",
          "text": "Output contains a table with at least 3 rows",
          "type": "programmatic"
        },
        {
          "id": "a3",
          "text": "Executive summary is present and under 200 words",
          "type": "qualitative"
        }
      ]
    }
  ]
}
```

### Assertion types
- `programmatic` — can be checked with a script (file exists, word count, regex match)
- `qualitative` — requires human or LLM judgment (tone, accuracy, completeness)

---

## grading.json

Written by a grader after evaluating assertions against outputs.

```json
{
  "eval_id": 1,
  "run_type": "with_skill",
  "assertions": [
    {
      "text": "Output file is a valid .docx",
      "passed": true,
      "evidence": "File opened successfully with python-docx; no errors."
    },
    {
      "text": "Output contains a table with at least 3 rows",
      "passed": false,
      "evidence": "Table found but contains only 2 rows."
    }
  ]
}
```

> Field names must be exactly `text`, `passed`, `evidence` — the eval viewer depends on these.

---

## benchmark.json

Aggregated pass rates and timing across all runs in an iteration.

```json
{
  "skill_name": "your-skill-name",
  "iteration": 1,
  "configs": [
    {
      "name": "with_skill",
      "evals": [
        {
          "eval_id": 1,
          "eval_name": "descriptive-test-name",
          "pass_rate": 0.67,
          "total_tokens": 84000,
          "duration_ms": 23000
        }
      ],
      "aggregate": {
        "mean_pass_rate": 0.67,
        "stddev": 0.12,
        "mean_tokens": 84000,
        "mean_duration_ms": 23000
      }
    },
    {
      "name": "without_skill",
      "evals": [...],
      "aggregate": {...}
    }
  ],
  "delta": {
    "pass_rate": 0.18,
    "tokens": -12000,
    "duration_ms": -3000
  }
}
```

List `with_skill` before `without_skill` (or `old_skill`) in the `configs` array.

---

## eval_metadata.json

Per-run metadata file saved alongside outputs.

```json
{
  "eval_id": 1,
  "eval_name": "compliance-pdf-with-letterhead",
  "prompt": "Convert this contract to a compliance-formatted PDF with our letterhead",
  "assertions": [
    {
      "id": "a1",
      "text": "Output is a valid PDF",
      "type": "programmatic"
    }
  ]
}
```
