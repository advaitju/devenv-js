module.exports = {
	extends: ['airbnb', 'prettier', 'prettier/react'],
	plugins: ['prettier'],
	parser: 'babel-eslint',
	rules: {
		'react/jsx-filename-extension': [1, { extensions: ['.js', '.jsx'] }],
		'prettier/prettier': [
			'error',
			{
				endOfLine: 'lf',
				singleQuote: true,
				useTabs: true,
				tabWidth: 2,
				trailingComma: 'es5',
			},
		],
	},
};
