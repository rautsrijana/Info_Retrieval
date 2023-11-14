import argparse
import nltk
from nltk.corpus import wordnet
from nltk.stem import WordNetLemmatizer
from nltk.tokenize import word_tokenize, sent_tokenize

class Lemmatizer:
    def __init__(self):
        """
        Initialize the Lemmatizer class.
        Downloads WordNet data using NLTK.
        """
        nltk.download('wordnet')

    def lemmatize_text(self, text):
        """
        Lemmatize a given text by tokenizing it into sentences and words,
        lemmatizing each word using the WordNet Lemmatizer, and joining
        the lemmatized words back into sentences and the sentences back
        into a paragraph.

        Parameters:
        - text (str): The input text to be lemmatized.

        Returns:
        - str: The lemmatized text.
        """
        # Tokenize the text into sentences
        sentences = sent_tokenize(text)

        # Initialize the WordNet Lemmatizer
        lemmatizer = WordNetLemmatizer()

        # Lemmatize each word in each sentence
        lemmatized_sentences = []
        for sentence in sentences:
            # Tokenize the sentence into words
            words = word_tokenize(sentence)

            # Lemmatize each word using the WordNet Lemmatizer
            lemmatized_words = [lemmatizer.lemmatize(word, self.get_wordnet_pos(word)) for word in words]

            # Join the lemmatized words back into a sentence
            lemmatized_sentence = ' '.join(lemmatized_words)

            # Add the lemmatized sentence to the list
            lemmatized_sentences.append(lemmatized_sentence)

        # Join the lemmatized sentences back into a paragraph
        lemmatized_text = ' '.join(lemmatized_sentences)

        return lemmatized_text

    def get_wordnet_pos(self, word):
        """
        Get the WordNet POS (Part of Speech) tag for a given word.

        Parameters:
        - word (str): The input word.

        Returns:
        - str: The WordNet POS tag.
        """
        tag = nltk.pos_tag([word])[0][1][0].upper()
        tag_dict = {"N": wordnet.NOUN, "V": wordnet.VERB, "R": wordnet.ADV, "J": wordnet.ADJ}
        return tag_dict.get(tag, wordnet.NOUN)

def main():
    """
    Main function to handle command-line interface.
    Parses command-line arguments, creates a Lemmatizer instance,
    lemmatizes the input paragraph, and prints the original and
    lemmatized texts.
    """
    # Set up the command-line argument parser
    parser = argparse.ArgumentParser(description='Lemmatize a paragraph using NLTK.')
    parser.add_argument('paragraph', type=str, help='Input paragraph for lemmatization')

    # Parse the command-line arguments
    args = parser.parse_args()

    # Create an instance of the Lemmatizer class
    lemmatizer_instance = Lemmatizer()

    # Lemmatize the input paragraph
    lemmatized_result = lemmatizer_instance.lemmatize_text(args.paragraph)

    # Print the original and lemmatized texts for comparison
    print("Original text:")
    print(args.paragraph)
    print("\nLemmatized text:")
    print(lemmatized_result)

if __name__ == "__main__":
    # Call the main function when the script is executed
    main()
