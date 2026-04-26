-- HelixCare PHI redaction (MRN, SSN/national_id, DOB, phone, email).
-- Applied to free-form log "log" / "message" fields by Fluent Bit Lua filter.

local function redact_text(s)
    if type(s) ~= "string" then return s end
    -- US SSN  XXX-XX-XXXX
    s = s:gsub("%d%d%d%-%d%d%-%d%d%d%d", "[SSN-REDACTED]")
    -- 9+ digit national IDs (broad)
    s = s:gsub("(%D)(%d%d%d%d%d%d%d%d%d+)(%D)", "%1[NID-REDACTED]%3")
    -- DOB YYYY-MM-DD or DD/MM/YYYY or MM/DD/YYYY
    s = s:gsub("%d%d%d%d[-/]%d%d[-/]%d%d", "[DOB-REDACTED]")
    s = s:gsub("%d%d[/-]%d%d[/-]%d%d%d%d", "[DOB-REDACTED]")
    -- MRN style "MRN-12345678" or "MRN: 12345678"
    s = s:gsub("[Mm][Rr][Nn][:%s%-]+%w+", "[MRN-REDACTED]")
    -- Email
    s = s:gsub("[%w%._-]+@[%w%._-]+%.%w+", "[EMAIL-REDACTED]")
    -- E.164 phone numbers
    s = s:gsub("%+%d[%d%-%s]+%d", "[PHONE-REDACTED]")
    return s
end

function redact(tag, ts, record)
    if record["log"]     then record["log"]     = redact_text(record["log"])     end
    if record["message"] then record["message"] = redact_text(record["message"]) end
    if record["msg"]     then record["msg"]     = redact_text(record["msg"])     end
    return 1, ts, record
end
