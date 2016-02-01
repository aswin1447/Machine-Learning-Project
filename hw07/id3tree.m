function T=id3tree(xTr,yTr,maxdepth,weights)
% function T=id3tree(xTr,yTr,maxdepth,weights)
%
% The maximum tree depth is defined by "maxdepth" (maxdepth=2 means one split).
% Each example can be weighted with "weights".
%
% Builds an id3 tree
%
% Input:
% xTr | dxn input matrix with n column-vectors of dimensionality d
% yTr | 1xn input matrix
% maxdepth = maximum tree depth
% weights = 1xn vector where weights(i) is the weight of example i
%
% Output:
% T = decision tree
%

%% fill in code here
% I need to  get the index from the original dataset

%first I set the length to 1000



[m,n] = size(xTr);

%this is to store all decision tree in a two-dimension array

%indxNow is to record the position in cell for the next node we need to tackle
if nargin == 2
  maxdepth = Inf;
  weights = ones(1,n)/n;

T = zeros(6,1000);
% just assume that we have not assign the maxdepth
elseif nargin == 3
  weights = ones(1,n)/n;
end


%indexCell = cell(l)
indexCell = {};
levelCell = {};
positioncell = {};
parentcell = {};


#first set the index into the cell
nodeIndex = linspace(1,n,n);
depth = 0;
index = 0;
parent = 0;


IndexNow = 1;

%set the information for the leftNode to cell
indexCell{IndexNow} = nodeIndex;
levelCell{IndexNow} = 1;
positioncell{IndexNow} = IndexNow;
parentcell{IndexNow} = 0;

%indexMax means the position for the next cell should be
IndexMax = 1;

%I set the right node before the leftNode, can I concentrate on computing leftnode and after computing the leftNode, I can work on computing rightnode
while(IndexNow <= IndexMax)

  IndexIncell = IndexNow;
  indexTem = indexCell{IndexIncell};
  levelTem = levelCell{IndexIncell};
  positionTem = positioncell{IndexIncell};
  parentTem = parentcell{IndexIncell};

  xTrTem = xTr(:,indexTem);
  yTrTem = yTr(indexTem);
  weightTem = weights(indexTem);


   indexFeatureToCut = 0;
   cutValue = 0;
   indexOfLeftT = 0;
   indexOfRightT = 0;
   parent = parentTem;
   prediction = mode(yTrTem);
   
   if levelTem >= maxdepth
     result = [prediction; indexFeatureToCut; cutValue; indexOfLeftT; indexOfRightT; parent];
     T(:,positionTem) = result;
     IndexNow = IndexNow + 1;
     continue
  end

  if all(yTrTem == yTrTem(1))
     result = [prediction; indexFeatureToCut; cutValue; indexOfLeftT; indexOfRightT; parent];
     T(:,positionTem) = result;
     IndexNow = IndexNow + 1;
     continue
  end

   [temSizeRow,temSizeCol] = size(yTrTem);
   judge = xTrTem - repmat(xTrTem(:,1),1,temSizeCol);
   judge = sum(abs(judge),2);

   if(sum(judge) == 0)
      result = [prediction; indexFeatureToCut; cutValue; indexOfLeftT; indexOfRightT; parent];
      T(:,positionTem) = result;
      IndexNow = IndexNow + 1;
      continue
   end

   [feature,cut,Hbest]=entropysplit(xTrTem,yTrTem,weightTem);
   indexLeftNode = find(xTr(:,indexTem)(feature,:) < cut);
   indexLeftNode = indexTem(indexLeftNode);
   indexRightNode = find(xTr(:,indexTem)(feature,:) >= cut);
   indexRightNode = indexTem(indexRightNode);
   numberLeftNode = length(indexLeftNode);
   numberRightNode = length(indexRightNode);

   left = IndexMax + 1;
   right = IndexMax + 2;

   if(numberLeftNode == 0)
      left = 0;
   end
   if(numberRightNode == 0)
      right = 0;
   end

   prediction = mode(yTrTem);
   indexFeatureToCut = feature;
   cutValue = cut;
   indexOfLeftT = left;
   indexOfRightT = right;
   parent = parentTem;
   result = [prediction; indexFeatureToCut; cutValue; indexOfLeftT; indexOfRightT; parent];
   T(:,positionTem) = result;
   
   
   if(levelTem >= maxdepth)
      IndexNow = IndexNow + 1;
      continue
   end

   if(numberLeftNode != 0)
     IndexMax = IndexMax + 1;
     indexCell{IndexMax} = indexLeftNode;
     levelCell{IndexMax} = levelTem + 1;
     positioncell{IndexMax} = left;
     parentcell{IndexMax} = positionTem;
   end

   if(numberRightNode != 0)
     IndexMax = IndexMax + 1;
     indexCell{IndexMax} = indexRightNode;
     levelCell{IndexMax} = levelTem + 1;
     positioncell{IndexMax} = right;
     parentcell{IndexMax} = positionTem;
   end

   IndexNow = IndexNow + 1;
end
IndexMax;
T = T(:,1:IndexMax);
