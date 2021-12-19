module.exports = {
	extends: ['airbnb', 'prettier'],
	plugins: ['prettier'],
	parser: '@babel/eslint-parser',
	parserOptions: {
		requireConfigFile: false,
		babelOptions: {
			presets: ['@babel/preset-react'],
		},
	},
	rules: {
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
		'no-console': 'off',
		'react/prop-types': 0,
		'react/jsx-filename-extension': [1, { extensions: ['.js', '.jsx'] }],
		'react/function-component-definition': [
			2,
			{
				namedComponents: 'function-declaration',
			},
		],
	},
	env: {
		node: true,
	},
};
