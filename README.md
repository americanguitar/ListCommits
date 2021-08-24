# ListCommits
For GM technical assignment

To whom it may concern. This is the technical assignment for GM iOS developer positions.
My basement flooded last night and I am supposed to leave town for a week starting tomorrow and will
have to leave this assignment as is for the moment. Here is an explanation of what is done so far.
The project is written using SwiftUI.
I have a Data file that makes the api call to GitHub and is currently retrieving the JSON
data but have yet to figure out the mapping to the JSON schema in order to use the JSON
decoder. In the interim, I have created a few fake entries and published them to the app
in the same manner the parsed JSON data will be. There are some very simple unit tests
included but have not written any for the networking code yet. I created a CommitRow
struct for the CommitList but was in the middle of trying to determine why it was not
conforming to View. I have used a pattern similar tp this before but could probably use to
further separate some of the networking and parsing.
