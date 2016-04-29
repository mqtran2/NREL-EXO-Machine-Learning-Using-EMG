 win_size = 256;
win_inc = 128; % training data has 50% overlap between windows
%%



%load data

	[testing_data,testing_motion,testing_index] = load_data('perturbation3_fromfront');
	feature_testing = extract_feature(testing_data,win_size,win_inc);



%index perturbation
		class_testing = ones(1237,1);
		class_testing([59:78 122:145 209:233 297:324 389:420 466:500 529:559 611:645 699:730 802:826 895:924 937:975 983:1010 1058:10871120:1152 1189:1214 1224:1237]) = 2;
%%


%Take a portion of data to create training set
%
	a= daqread('perturbation3_fromfront.daq');
	training_data = a(1:114000,:);
	training_motion = testing_motion(1:10);
	training_index = testing_index(1:10);
	feature_training = extract_feature(training_data,win_size,win_inc);
%%
class_training = ones(889,1);
class_training([59:78 122:145 209:233 297:324 389:420 466:500 529:559 611:645 699:730 802:826 ]) = 2;

%remove transition
	[feature_training,class_training] = remove_transitions(feature_training,class_training);
%%
% uncomment this code to include two sets of data in the training set
	% [training_data,training_motion,training_index] = load_data('s4t2');
	% feature_training_tmp = extract_feature(training_data,win_size,win_inc);
	% class_training_tmp = getclass(training_data,training_motion,training_index,win_size,win_inc);
	% 
	% feature_training = [feature_training; feature_training_tmp];
	% class_training = [class_training; class_training_tmp];

	%[feature_training,class_training] = remove_transitions(feature_training,class_training);

	% create testing set (uncomment which trial you want to test on
	% [testing_data,testing_motion,testing_index] = load_data('s4t1');
	% [testing_data,testing_motion,testing_index] = load_data('s4t2');
	        %[testing_data,testing_motion,testing_index] = load_data('s4t3');

	 
	% [testing_data,testing_motion,testing_index] = load_data('s4t4');
	% [testing_data,testing_motion,testing_index] = load_data('s4t5');
	% [testing_data,testing_motion,testing_index] = load_data('s4t6');

%%
	% leave commented to have to feature reduction
	% uncomment one of these lines for either PCA feature reduction
	% or ULDA feature reduction
	Nfeat = 4; % number of features to reduce to
	%[feature_training,feature_testing] = pca_feature_reduction(feature_training,Nfeat,feature_testing);
	%[feature_training,feature_testing] = ulda_feature_reduction(feature_training,Nfeat,class_training,feature_testing);
%%
% no post-processing
	pause;
	[error_training,error_testing,classification_training,classification_testing]...
	    = knnclassify(feature_training,feature_testing,class_training,class_testing,5);
	%{
	[error_training,error_testing,classification_training,classification_testing]...
	    = knnclassify(feature_training,feature_testing,class_training,class_testing,5);
	    %}
%% SVM
	svmStruct = svmtrain(feature_training,class_training);
	results = svmclassify(svmStruct,feature_testing);
	error_svm = sum(results ~= class_testing)./length(class_testing);
%%
% majority vote smoothing
	classification_testing_maj = majority_vote(classification_testing,8,0);
	error_testing_maj = sum(classification_testing_maj ~= class_testing)/length(class_testing)*100;
%%
% remove transitions from computation of classification accuracy
	[classification_testing_nt,class_testing_nt] = remove_transitions(classification_testing,class_testing);
	error_testing_nt = sum(classification_testing_nt ~= class_testing_nt)/length(class_testing_nt)*100;
%%
% majority vote smooth and remove transitions from computation of classification accuracy
	[classification_testing_maj_nt,class_testing_nt] = remove_transitions(classification_testing_maj,class_testing);
	error_testing_maj_nt = sum(classification_testing_maj_nt ~= class_testing_nt)/length(class_testing_nt)*100;
