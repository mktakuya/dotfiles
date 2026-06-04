#!/usr/bin/env python3
"""
編集済みの ADF JSON を Jira update ペイロードにラップする。

Usage:
    python create_payload.py <TICKET_KEY> [edited_json_file]

    TICKET_KEY:       Jira チケットキー (例: ABC-123)
    edited_json_file: 編集済み ADF JSON ファイルパス
                      (デフォルト: /tmp/jira_desc_<ticket_key>.json)

Output: /tmp/jira_payload_<ticket_key>.json
"""

import json
import sys

def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)

    ticket_key = sys.argv[1]
    key_lower = ticket_key.lower()
    json_file = sys.argv[2] if len(sys.argv) > 2 else f"/tmp/jira_desc_{key_lower}.json"

    with open(json_file) as f:
        adf = json.load(f)

    payload = {
        "issues": [ticket_key],
        "description": adf,
    }

    output_path = f"/tmp/jira_payload_{key_lower}.json"
    with open(output_path, "w") as f:
        json.dump(payload, f, ensure_ascii=False, indent=2)

    print(f"Payload saved to {output_path}")

if __name__ == "__main__":
    main()
