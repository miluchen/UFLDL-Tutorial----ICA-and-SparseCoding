function [cost, grad] = orthonormalICACost(theta, visibleSize, numFeatures, patches, epsilon)
%orthonormalICACost - compute the cost and gradients for orthonormal ICA
%                     (i.e. compute the cost ||Wx||_1 and its gradient)

    weightMatrix = reshape(theta, numFeatures, visibleSize);
    
    cost = 0;
    grad = zeros(numFeatures, visibleSize);
    
    % -------------------- YOUR CODE HERE --------------------
    % Instructions:
    %   Write code to compute the cost and gradient with respect to the
    %   weights given in weightMatrix.     
    % -------------------- YOUR CODE HERE --------------------     

	% compute the cost
	numExamples = size(patches, 2);
	cost = sum(sum(sqrt((weightMatrix*patches).^2 + epsilon)))/numExamples;
	% compute the gradient
	grad = ((weightMatrix*patches).^2+epsilon).^(-0.5).*(weightMatrix*patches)*patches'./numExamples;
	grad = grad(:);

end

