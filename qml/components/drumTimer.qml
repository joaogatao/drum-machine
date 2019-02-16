import QtQuick 2.0

Item {
    id: drumtime
    property double startTime: 0
    property int secondsElapsed: 0

    function restartCounter()  {

            drumtime.startTime = 0;

        }

    function timeChanged()  {
        if(drumtime.startTime==0)
        {
            drumtime.startTime = new Date().getTime(); //returns the number of milliseconds since the epoch (1970-01-01T00:00:00Z);
        }
        var currentTime = new Date().getTime();
        drumtime.secondsElapsed = (currentTime-startTime);
    }

}
