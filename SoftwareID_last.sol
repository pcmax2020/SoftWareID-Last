pragma solidity ^0.5.0;

contract  SoftwareIDdueDate{
    
    struct SoftwareID {
        string softwareName;
        bool dueDateUpdated;
    }
    
      string Computer_ID;
   string Employee_ID;
   string Authorized_by;
   
  
// setting user information   
   function SetUserInfo( string memory _Computer_ID,string memory _Employee_ID,
   string memory _Authorized_by) public {
             Employee_ID = _Employee_ID;
       Authorized_by = _Authorized_by;
       Computer_ID = _Computer_ID;
   
   }
//getting user information
   function GetUserInfo() public view returns (string memory,string memory,string memory) {
return (Computer_ID, Employee_ID, Authorized_by);
   }
         SoftwareID[] public softwareIDs;
// creating software information (name, due date)
    function CreateSoftwareInfo(string memory _softwareName) public {
        softwareIDs.push(SoftwareID(_softwareName, false));

        softwareIDs.push(SoftwareID({
            softwareName: _softwareName,
            dueDateUpdated: false
        }));

        SoftwareID memory softwareID;
        softwareID.softwareName = _softwareName;
        softwareIDs.push(softwareID);
    }
//update software information (update due date)
        function UpdateDueDate(uint _index, string memory _softwareName) public {
        SoftwareID storage softwareID = softwareIDs[_index];
        softwareID.softwareName = _softwareName;
    }
// Validate software updated information    
        function ValidateDateUpdate(uint _index) public {
        SoftwareID storage softwareID = softwareIDs[_index];
        softwareID.dueDateUpdated = !softwareID.dueDateUpdated;
        }