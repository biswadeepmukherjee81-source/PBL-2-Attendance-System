// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttendanceSystem {

    // Student structure
    struct Student {
        string name;
        uint roll;
    }

    // Attendance structure
    struct AttendanceRecord {
        uint roll;
        string subject;
        bool present;
    }

    // Mapping: roll → student
    mapping(uint => Student) public students;

    // All attendance records
    AttendanceRecord[] public records;

    // Add student
    function addStudent(uint _roll, string memory _name) public {
        students[_roll] = Student(_name, _roll);
    }

    // Mark attendance
    function markAttendance(uint _roll, string memory _subject, bool _present) public {
        records.push(AttendanceRecord(_roll, _subject, _present));
    }

    // Get record by index
    function getRecord(uint index) public view returns (uint, string memory, bool) {
        AttendanceRecord memory r = records[index];
        return (r.roll, r.subject, r.present);
    }

    // Total records count
    function totalRecords() public view returns (uint) {
        return records.length;
    }

    // ⭐ FINAL FEATURE: Calculate attendance percentage
    function getAttendancePercentage(uint _roll) public view returns (uint) {
        uint total = 0;
        uint presentCount = 0;

        for (uint i = 0; i < records.length; i++) {
            if (records[i].roll == _roll) {
                total++;
                if (records[i].present) {
                    presentCount++;
                }
            }
        }

        if (total == 0) {
            return 0;
        }

        return (presentCount * 100) / total;
    }
}