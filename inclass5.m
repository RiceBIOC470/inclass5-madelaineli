%Inclass assignment 5. 
function inclass5()
figure(1)
image_1percent('BW.jpg')
figure(2)
image_same('BW.jpg',0.3)
figure(3)
image_specify_or_default('BW.jpg',0.2)
figure(4)
image_specify_or_default('BW.jpg')

problem_2 = complementary('ATGCATGC');
disp('problem 2');
disp(problem_2);


end
% 1. (a) Write a function that reads in an image and displays it so that 1%
% of the pixels are black and 1% of the pixels are white. Hint: your
% function can call the stretchlim function, see the help for that function.
% (b) Write a second function where the fraction of pixels to display as
% black or white are equal and can be specified as a second input to this
% function. (c) Redo part (b) but make the option to specify the fraction
% of black/white pixels optional with a default value of 1% if not
% specified. 
function image_1percent(image)
img = imread(image);
img = img(:,:,1);
low_high = stretchlim(img);
img_new = imadjust(img,low_high,[0.01,0.99]);
imshow(img_new);
end

function image_same(image,fraction)
img = imread(image);
img = img(:,:,1);
low_high = stretchlim(img);
img_new = imadjust(img,low_high,[fraction,1-fraction]);
imshow(img_new);
end

function image_specify_or_default(varargin)
img = imread(varargin{1});
img = img(:,:,1);
low_high = stretchlim(img);
if nargin == 2
    img_new = imadjust(img,low_high,[varargin{2},1-varargin{2}]);
else
    img_new = imadjust(img,low_high,[0.01,0.99]);
end
    imshow(img_new);
end

%2. Write a function to take the reverse complement of a DNA sequence, that
%is, returns the complementary base pair for each base, read from end
%to beginning. (e.g. the reverse compliment of ATGC is GCAT). Do not use the
%builtin MATLAB function for this. 
function comp_DNA = complementary(seq)
    for ii = 1:length(seq)
        if seq(ii) == 'A'
            comp_DNA(ii) = 'T';
        elseif seq(ii) == 'T'
            comp_DNA(ii) = 'A';
        elseif seq(ii) == 'G'
            comp_DNA(ii) = 'C';
        elseif seq(ii) == 'C'
            comp_DNA(ii) = 'G';
        end
    end
    comp_DNA = fliplr(comp_DNA);
end
